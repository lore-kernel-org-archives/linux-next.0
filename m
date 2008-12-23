From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 23 Dec 2008 02:26:28 -0800
Message-ID: <200812230226.29519.inaky@linux.intel.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au> <200812220926.43784.inaky@linux.intel.com> <20081223043139.GG1928@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:28907 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750813AbYLWK0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Dec 2008 05:26:44 -0500
In-Reply-To: <20081223043139.GG1928@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Monday 22 December 2008, Greg KH wrote:
> On Mon, Dec 22, 2008 at 09:26:43AM -0800, Inaky Perez-Gonzalez wrote:
> > On Sunday 21 December 2008, Sam Ravnborg wrote:
> >
> > ops -- ok, I will. I guess I have to add this in all the similar ones,
> > right?
> >
> > Greg, do you want a new patch series or just another patch on top?
>
> Just a single replacement patch for when we add this makefile is fine
> with me.

Hmmm, there was more feedback Sam gave me on Kconfig and Makefiles I added,
so at the end the patch touches more files than just this one. Maybe a whole
new series will be the way to go.

-- 
Inaky
