From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build warnings
Date: Fri, 19 Jun 2009 23:06:09 -0700
Message-ID: <20090620060559.GA7710@dtor-d630.eng.vmware.com>
References: <20090612170536.109df1d8.sfr@canb.auug.org.au> <1244843690.3224.10.camel@hp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f202.google.com ([209.85.216.202]:47548 "EHLO
	mail-px0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818AbZFTGGM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2009 02:06:12 -0400
Content-Disposition: inline
In-Reply-To: <1244843690.3224.10.camel@hp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tero Saarni <tero.saarni@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 13, 2009 at 12:54:50AM +0300, Tero Saarni wrote:
> On Fri, 2009-06-12 at 17:05 +1000, Stephen Rothwell wrote:
> > Hi Dmitry,
> > 
> > Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> > 
> > drivers/input/evdev.c: In function 'evdev_do_ioctl':
> > drivers/input/evdev.c:632: warning: comparison of distinct pointer types lacks a cast
> > drivers/input/evdev.c:660: warning: comparison of distinct pointer types lacks a cast
> > 
> > Introduced by commit 61c7bfcdf5acee06f58b246d6615989134719d19 ("Input:
> > synaptics - add support for reporting x/y resolution").
> 
> My mistake, thanks for the heads up!
> 
> 
> Input: fix warning: comparison of distinct pointer types
> 

I folded it into the original patch.

Thanks.

-- 
Dmitry
