From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: rtl8188eu: style fixes
Date: Fri, 28 Apr 2017 12:29:32 +0200
Message-ID: <20170428102932.GB20250@kroah.com>
References: <20170420214226.GB1347@lear>
 <20170421042156.GA11495@kroah.com>
 <20170421080623.GA2553@lear>
 <20170421081849.GA20003@kroah.com>
 <20170423190305.GB7641@lear>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37828 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2992611AbdD1Kaz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2017 06:30:55 -0400
Content-Disposition: inline
In-Reply-To: <20170423190305.GB7641@lear>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Galo <anglor@varoa.net>
Cc: linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

On Sun, Apr 23, 2017 at 09:03:06PM +0200, Galo wrote:
> Fix multiple CHECK and WARNING issues in rtl8188eu/core/rtw_mlme.c,
> mainly long lines, spaces around operators, unnecessary curly brackets.
> 
> Signed-off-by: Galo Navarro <anglor@varoa.net>
> 
> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme.c | 186 +++++++++++++++++-------------
>  1 file changed, 103 insertions(+), 83 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
