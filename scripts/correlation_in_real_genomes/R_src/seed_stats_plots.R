
scatter.seed.plot<-function(data,l,k,xlab="Mismatches",
				ylab="y",
				main="Scatterplot"
				){
	cor1 = round(cor(data[,l],data[,k],method="pearson"),4)
	cor2 = round(cor(data[,l],data[,k],method="spearman"),4)
	corstr<-paste("Pearson's correlation: ",toString(cor1),"\n",
	             "Spearman's rank correlation: ",toString(cor2),sep="")                                                   
	df<-as.data.frame(data)
	colnames(df)<-paste("V",1:NCOL(df),sep="")
        
	library(fields)
        legend.fun <- function(){
          xm <- get('xm', envir = parent.frame(1))
          ym <- get('ym', envir = parent.frame(1))
          z  <- get('dens', envir = parent.frame(1))
	  #print(apply(z,2,sum))
          colramp <- get('colramp', parent.frame(1))
	  image.plot(xm,ym,z, col = colramp(256), legend.only = T, add =F)
	 }

	  par(mar = c(5,4,4,5) + .1,pty="s",bty="l")
	  Lab.palette <- colorRampPalette(c("white", "grey", "black"), space = "Lab")
	  #Lab.palette <- colorRampPalette(c("white", "black"), space = "Lab")
	  with(df,{
	        smoothScatter(
		as.formula(paste("V",k,"~V",l,sep="")),
		NULL,
		nbin=200, 
		#nbin=max(df[,l],df[,k])-2,
		1, 		
	        colramp = Lab.palette,
		nrpoints = 0,#Inf,
	  	#postPlotHook = legend.fun,
		#aspect=1,
		xlab="",ylab="",
		main=main
		)
		#mtext(xlab,side=1, line=1)
		title(
		sub=corstr,
		cex.sub=0.85,
		adj=1,
		mgp=c(3, 1, 0)
		)
		title(
		xlab=xlab, ylab=ylab,
		mgp=c(2.2, 1, 0)
		)
	  })
}

count2d.plot<-function(data,l,k,xlab="Mismatches",ylab="y",main="Countplot",
				#do.logplot=TRUE,
				#do.hexbin=FALSE,
				normalize.rows=FALSE,
				plot.split.args=list(c(1,1,1,3),c(1,2,1,3),c(1,3,1,3)),
				plot.more=FALSE
				){
	cor1 = round(cor(data[,l],data[,k],method="pearson"),4)
	cor2 = round(cor(data[,l],data[,k],method="spearman"),4)
	corstr<-paste("Pearson's correlation: ",toString(cor1),"\n",
	             "Spearman's rank correlation: ",toString(cor2),sep="")                                                   
    	print(corstr)

	if (TRUE){#do.logplot){
	    ag.data<-aggregate(data[,1],by=list(x=data[,l],y=data[,k]),length)
	    ag.data<-as.data.frame(ag.data)
	    colnames(ag.data)[3]<-"count"
	    
	    if (normalize.rows) {		
		ysums<-aggregate(ag.data$count,by=list(y=ag.data$y),sum)
		#xsums<-aggregate(ag.data$count,by=list(x=ag.data$x),sum)
		ag.data<-do.call(rbind,
			    lapply(1:NROW(ag.data),
				   function(i)transform(ag.data[i,,drop=FALSE],
					      count=count/ysums[ysums$y==y,2]))
					      #count=count/xsums[xsums$x==x,2]))
					      #count=count/sqrt(xsums[xsums$x==x,2]*ysums[ysums$y==y,2])))
			 )		
		color.var<-ag.data$count
		color.brks<-c(seq(0,0.4,by=0.08),1)
	    } else {
		color.var<-log10(ag.data$count)
		#n.breaks<-5
		#color.brks<-quantile(color.var,probs=seq(0,1,length.out=n.breaks))
		color.brks<-seq(0,ceiling(2*max(color.var))/2,by=0.5) #length.out=9)		
	    }
	    
	    cnt.factor<-cut(color.var,breaks=color.brks)                                    
	    library(gplots)		
	    ncolors<-length(levels(cnt.factor))
	    #all.colors<-terrain.colors(ncolors)
	    all.colors<-colorpanel(ncolors,low="green",mid="yellow",high="red")
	    all.colors.long<-colorpanel(100,low="green",mid="yellow",high="red")
	    #Colorblind safe colors from http://colorbrewer2.org/
	    #all.colors<-colorpanel(ncolors,low="#fde0dd",mid="#fa9fb5",high="#c51b8a")
	    #all.colors<-colorpanel(ncolors,low="#e0f3db",mid="#a8ddb5",high="#43a2ca")		
	    	    	    
	    library(lattice)
	    #library(latticeExtra)       
	    p1<-xyplot(
		y~x,
		data=ag.data,
		#subset=x<6,
		pch=20,
		aspect=1,
		col=all.colors[as.integer(cnt.factor)],
		main=main, xlab=xlab, ylab=ylab, 
		sub=list(label=corstr,cex=0.8,just="right"),
		key=list(x=0.99,y=0.99,
			corner=c(1,1),
			rectangles=list(col=all.colors,lty=0,size=3),
			#text=list(levels(cnt.factor))
			#text=list(paste("<=10^",color.brks[-1],sep=""))
			#More Fancy labels
			text=list(sapply(color.brks[-1],
				function(y)
				if(!normalize.rows) as.expression(bquote(phantom(x)<="10"^.(as.character(y))))
				else as.expression(bquote(phantom(x)<=.(as.character(y))))
				)),
			title=if(normalize.rows) "Y-dim density"
			      else "case count",
			cex.title=0.9
			)
	    )	    
	    p2<-contourplot(
		count~x*y,
		data=ag.data,
		#subset=x<6,
		cuts=15,
		region=TRUE,
		col.regions=all.colors.long,
		xlab=xlab, ylab=ylab, 
		main=main, 
		sub=list(label=corstr,cex=0.8,just="right"),
		key=list(x=0.99,y=0.99,
			corner=c(1,1),
			border=TRUE,
			lines=list(col=1),
			text=list(if(normalize.rows) "Y-dim density"
			      else "case count")			
			)
	    )	    
	}
	
	#if (do.hexbin){
	    library(hexbin)
	    df<-as.data.frame(data)
	    colnames(df)<-paste("V",1:NCOL(df),sep="")
	#print(summary(df[,k]))
	#print(summary(df[,l]))
	    p3<-hexbinplot(
		as.formula(paste("V",k,"~V",l,sep="")),
		data=df,
		ybnds=range(df[,k])+c(-1,1),
		xbnds=range(df[,l])+c(-1,1),
		aspect=1,
		xbin=max(data[,l],data[,k])-2,
		main=main, xlab=xlab, ylab=ylab, 
		sub=list(label=corstr,cex=0.8,just="right")
	    ) 
	#} 
	
	#if (do.logplot & do.hexbin){
	    print(p1,split=plot.split.args[[1]],more=TRUE)
	    print(p2,split=plot.split.args[[2]],more=TRUE)
	    print(p3,split=plot.split.args[[3]],more=plot.more)
	#}
	#else if (do.logplot) print(p1)
	#else if (do.hexbin)  print(p2)
}


library(ggplot2)
library(gridExtra)

conf.seed.plot<-function(data,l,k,
                        percent.conf=95,
                        xlab="Mismatches",
                        ylab="Criterion",
                        main="",
                        conf.width.plot=FALSE,
                        reverse.axes=FALSE
				){ 
ag.data<-aggregate(data[,1],by=list(x=data[,k],y=data[,l]),length)    
    ag.data<-as.data.frame(ag.data)    
    colnames(ag.data)[3]<-"count"
    #Sorted by y now

    ysums<-aggregate(ag.data$count,by=list(y=ag.data$y),sum)
    #xsums<-aggregate(ag.data$count,by=list(x=ag.data$x),sum)
    ag.data<-do.call(rbind,
            lapply(1:NROW(ag.data),
               function(i)transform(ag.data[i,,drop=FALSE],
                      count=count/ysums[ysums$y==y,2]))
         )		
    
    yagg<-aggregate(ag.data[,c("x","count")],by=list(y=ag.data$y),function(v)v)
    
    lcut<-(1-percent.conf/100)/2
    rcut<-1-lcut
        
    qagg<-do.call(rbind,lapply(1:NROW(yagg),
            function(i)c(
                y=yagg$y[[i]],
                x.1=yagg$x[[i]][min(length(yagg$x[[i]]),head(which(cumsum(yagg$count[[i]])>lcut),1))],
                x.9=yagg$x[[i]][max(1,tail(which(cumsum(yagg$count[[i]])<rcut),1))],
                mean=weighted.mean(yagg$x[[i]],yagg$count[[i]])
             )))  
     
    #head(as.data.frame(qagg))
    A<-as.data.frame(qagg)            
    if (conf.width.plot){
        A$type=paste(percent.conf,"% conf.\nwidth",sep="")
        p1 <- ggplot(data=A, aes(x=y, y=x.9-x.1, linetype=type)) + 
     geom_line() + 
     geom_point() +
     #geom_ribbon(alpha=0.5) + 
     #scale_x_log10() + 
     #scale_y_log10() + 
     ylab(ylab) + 
     xlab(xlab) +
     ggtitle(main)
    } else {
        A$type=paste("mean and\n",percent.conf,"% conf.",sep="")
    p1 <- ggplot(data=A, aes(x=y, y=mean, ymin=x.1, ymax=x.9, fill=type, linetype=type)) + 
     geom_line() + 
     geom_point() +
     geom_ribbon(alpha=0.5) + 
     #scale_x_log10() + 
     #scale_y_log10() + 
     ylab(ylab) + 
     xlab(xlab) +
     ggtitle(main)
    if (reverse.axes)
        p1<-p1+scale_x_reverse()+scale_y_reverse()
    }
    #ggsave(p, file="CC-vs_nCC_kT_prof.png", width=8, height=4.5)
    p1
}
	
