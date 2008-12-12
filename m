From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] staging: really fix up Kconfig automatic deselction
Date: Fri, 12 Dec 2008 10:55:57 -0800
Message-ID: <20081212185557.GB25992@kroah.com>
References: <20081208150832.GB19711@kroah.com> <1228785051-12954-1-git-send-email-dbaryshkov@gmail.com> <20081209035444.GA22626@suse.de> <493DF4EC.70509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:37847 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753110AbYLLTiJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2008 14:38:09 -0500
Content-Disposition: inline
In-Reply-To: <493DF4EC.70509@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Greg KH <gregkh@suse.de>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Dec 09, 2008 at 07:32:44AM +0300, Dmitry Eremin-Solenikov wrote:
> Greg KH wrote:
>> On Tue, Dec 09, 2008 at 04:10:51AM +0300, Dmitry Eremin-Solenikov wrote:
>>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> This patch should be used instead of your current one in my tree, right?
>> Or apply it on top of your current one?
>
> On top of the previous one. If you want, you can squash them into one 
> commit, of course.

I've merged them together now, thanks for the fix.

greg k-h
