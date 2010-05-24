From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the kgdb tree
Date: Mon, 24 May 2010 13:34:03 -0700
Message-ID: <201005241334.04277.dmitry.torokhov@gmail.com>
References: <20100323150443.608ad7f0.sfr@canb.auug.org.au> <20100524181735.GC6033@core.coreip.homeip.net> <4BFADBC1.9000802@windriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:37502 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756336Ab0EXUeL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 May 2010 16:34:11 -0400
In-Reply-To: <4BFADBC1.9000802@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 24 May 2010 01:04:17 pm Jason Wessel wrote:
> On 05/24/2010 01:17 PM, Dmitry Torokhov wrote:
> > Do we really need to force SysRq on or off? Maybe we should export
> > __handle_sysrq() instead?
> 
> It seems cleanest to export __handle_sysrq() if that is ok?

Yes, I think this is the best option. Please feel free to merge through
your tree.

Thanks.

-- 
Dmitry
