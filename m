From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] serial: imx: Fix build breakage
Date: Fri, 11 Jul 2014 17:42:48 -0700
Message-ID: <20140712004248.GA24760@kroah.com>
References: <20140711112108.7631911b@canb.auug.org.au>
 <1405046206-14495-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405046206-14495-1-git-send-email-peter@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jul 10, 2014 at 10:36:46PM -0400, Peter Hurley wrote:
> Fix breakage introduced by
> commit c557d392fbf5badd693ea1946a4317c87a26a716,
> 'serial: Test for no tx data on tx restart'.
> 
> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>

You forgot a "Reported-by:" tag.

I'll go add it...
