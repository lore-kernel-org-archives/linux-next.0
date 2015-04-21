From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 10:12:07 -0300
Message-ID: <20150421101207.4616e284@recife.lan>
References: <20150421115409.73e6a066@canb.auug.org.au>
	<20150421180243.15b11537@canb.auug.org.au>
	<20150421065640.02f14142@recife.lan>
	<1908360.Iueb02OAJf@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60167 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbbDUNMW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2015 09:12:22 -0400
In-Reply-To: <1908360.Iueb02OAJf@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Boris Brezillion <boris.brezillon@free-electrons.com>, Hyun Kwon <hyun.kwon@xilinx.com>

Em Tue, 21 Apr 2015 15:38:02 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Tuesday 21 April 2015 06:56:40 Mauro Carvalho Chehab wrote:
> > Em Tue, 21 Apr 2015 18:02:43 +1000 Stephen Rothwell escreveu:
> > > On Tue, 21 Apr 2015 10:49:52 +0300 Laurent Pinchart wrote:
> > > > >  +#define MEDIA_BUS_FMT_YUV10_1X30              0x2016
> > > > >  +#define MEDIA_BUS_FMT_AYUV8_1X32              0x2017
> > > > >  +#define MEDIA_BUS_FMT_UYVY12_2X12             0x201c
> > > > >  +#define MEDIA_BUS_FMT_VYUY12_2X12             0x201d
> > > > >  +#define MEDIA_BUS_FMT_YUYV12_2X12             0x201e
> > > > >  +#define MEDIA_BUS_FMT_YVYU12_2X12             0x201f
> > > > 
> > > > The above 6 lines introduce duplicate defines, you can remove them.
> > > 
> > > OK, thanks, done for tomorrow.  Though hopefully all this will be
> > > resolved soon.
> > 
> > I think that the best is for me to merge from the DRM branch that Linus
> > picked, and solve the conflict there.
> > 
> > This way, it should be a way easier for Linus to pick it, and not
> > manually solve those conflicts with are not trivial.
> > 
> > Laurent/Philipp,
> > 
> > Please double-check if everything went fine on my conflict solving.
> > I'm pushing it at branch "fixes" at the media development tree:
> > 	git://linuxtv.org/media_tree.git fixes
> > 
> > In any case, I double-checked that it is compiling and it is producing the
> > media DocBook.
> > 
> > PS.: I intend to send this latter today for being merged upstream.
> 
> The numerical values are correct, but the order of the YUV formats got messed
> up. Could you squash the following change into the merge ?

Sure. Squashed.

Regards,
Mauro

> 
> diff --git a/Documentation/DocBook/media/v4l/subdev-formats.xml b/Documentation/DocBook/media/v4l/subdev-formats.xml
> index d66463b..2588ad7 100644
> --- a/Documentation/DocBook/media/v4l/subdev-formats.xml
> +++ b/Documentation/DocBook/media/v4l/subdev-formats.xml
> @@ -3432,6 +3432,43 @@ see <xref linkend="colorspaces" />.</entry>
>  	      <entry>y<subscript>1</subscript></entry>
>  	      <entry>y<subscript>0</subscript></entry>
>  	    </row>
> +	    <row id="MEDIA-BUS-FMT-YUV8-1X24">
> +	      <entry>MEDIA_BUS_FMT_YUV8_1X24</entry>
> +	      <entry>0x2025</entry>
> +	      <entry></entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>-</entry>
> +	      <entry>y<subscript>7</subscript></entry>
> +	      <entry>y<subscript>6</subscript></entry>
> +	      <entry>y<subscript>5</subscript></entry>
> +	      <entry>y<subscript>4</subscript></entry>
> +	      <entry>y<subscript>3</subscript></entry>
> +	      <entry>y<subscript>2</subscript></entry>
> +	      <entry>y<subscript>1</subscript></entry>
> +	      <entry>y<subscript>0</subscript></entry>
> +	      <entry>u<subscript>7</subscript></entry>
> +	      <entry>u<subscript>6</subscript></entry>
> +	      <entry>u<subscript>5</subscript></entry>
> +	      <entry>u<subscript>4</subscript></entry>
> +	      <entry>u<subscript>3</subscript></entry>
> +	      <entry>u<subscript>2</subscript></entry>
> +	      <entry>u<subscript>1</subscript></entry>
> +	      <entry>u<subscript>0</subscript></entry>
> +	      <entry>v<subscript>7</subscript></entry>
> +	      <entry>v<subscript>6</subscript></entry>
> +	      <entry>v<subscript>5</subscript></entry>
> +	      <entry>v<subscript>4</subscript></entry>
> +	      <entry>v<subscript>3</subscript></entry>
> +	      <entry>v<subscript>2</subscript></entry>
> +	      <entry>v<subscript>1</subscript></entry>
> +	      <entry>v<subscript>0</subscript></entry>
> +	    </row>
>  	    <row id="MEDIA-BUS-FMT-UYVY12-1X24">
>  	      <entry>MEDIA_BUS_FMT_UYVY12_1X24</entry>
>  	      <entry>0x2020</entry>
> @@ -3672,43 +3709,6 @@ see <xref linkend="colorspaces" />.</entry>
>  	      <entry>u<subscript>1</subscript></entry>
>  	      <entry>u<subscript>0</subscript></entry>
>  	    </row>
> -	    <row id="MEDIA-BUS-FMT-YUV8-1X24">
> -	      <entry>MEDIA_BUS_FMT_YUV8_1X24</entry>
> -	      <entry>0x2025</entry>
> -	      <entry></entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>-</entry>
> -	      <entry>y<subscript>7</subscript></entry>
> -	      <entry>y<subscript>6</subscript></entry>
> -	      <entry>y<subscript>5</subscript></entry>
> -	      <entry>y<subscript>4</subscript></entry>
> -	      <entry>y<subscript>3</subscript></entry>
> -	      <entry>y<subscript>2</subscript></entry>
> -	      <entry>y<subscript>1</subscript></entry>
> -	      <entry>y<subscript>0</subscript></entry>
> -	      <entry>u<subscript>7</subscript></entry>
> -	      <entry>u<subscript>6</subscript></entry>
> -	      <entry>u<subscript>5</subscript></entry>
> -	      <entry>u<subscript>4</subscript></entry>
> -	      <entry>u<subscript>3</subscript></entry>
> -	      <entry>u<subscript>2</subscript></entry>
> -	      <entry>u<subscript>1</subscript></entry>
> -	      <entry>u<subscript>0</subscript></entry>
> -	      <entry>v<subscript>7</subscript></entry>
> -	      <entry>v<subscript>6</subscript></entry>
> -	      <entry>v<subscript>5</subscript></entry>
> -	      <entry>v<subscript>4</subscript></entry>
> -	      <entry>v<subscript>3</subscript></entry>
> -	      <entry>v<subscript>2</subscript></entry>
> -	      <entry>v<subscript>1</subscript></entry>
> -	      <entry>v<subscript>0</subscript></entry>
> -	    </row>
>  	    <row id="MEDIA-BUS-FMT-YUV10-1X30">
>  	      <entry>MEDIA_BUS_FMT_YUV10_1X30</entry>
>  	      <entry>0x2016</entry>
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 3eeb8cc..190d491 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -75,6 +75,10 @@
>  #define MEDIA_BUS_FMT_YUYV10_2X10		0x200b
>  #define MEDIA_BUS_FMT_YVYU10_2X10		0x200c
>  #define MEDIA_BUS_FMT_Y12_1X12			0x2013
> +#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
> +#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
> +#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
> +#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
>  #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
>  #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
>  #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
> @@ -86,16 +90,12 @@
>  #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
>  #define MEDIA_BUS_FMT_VUY8_1X24			0x2024
>  #define MEDIA_BUS_FMT_YUV8_1X24			0x2025
> -#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
> -#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
> -#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
> -#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
> -#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
> -#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
>  #define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
>  #define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
>  #define MEDIA_BUS_FMT_YUYV12_1X24		0x2022
>  #define MEDIA_BUS_FMT_YVYU12_1X24		0x2023
> +#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
> +#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
>  
>  /* Bayer - next is	0x3019 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
> 
> 
