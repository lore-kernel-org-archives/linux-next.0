From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless tree build failure
Date: Tue, 28 Apr 2009 08:50:00 -0400
Message-ID: <20090428125000.GA4113@tuxdriver.com>
References: <20090422115738.524272c8.sfr@canb.auug.org.au> <20090428132817.5e86b172.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:56607 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759947AbZD1NBF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2009 09:01:05 -0400
Content-Disposition: inline
In-Reply-To: <20090428132817.5e86b172.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Matthew Garrett <mjg59@srcf.ucam.org>

On Tue, Apr 28, 2009 at 01:28:17PM +1000, Stephen Rothwell wrote:
> Hi John, Len,
> 
> On Wed, 22 Apr 2009 11:57:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/platform/x86/oqo-wmi.c: In function 'oqo_rfkill_init':
> > drivers/platform/x86/oqo-wmi.c:767: error: 'struct rfkill' has no member named 'user_claim_unsupported'
> > 
> > Caused by commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 ("rfkill:
> > remove user_claim stuff") interacting with commit
> > 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86: Add oqo-wmi
> > driver for model 2 OQO backlight and rfkill control") from the acpi tree.
> > 
> > I have reverted commit bc3e4095713c0bf57c8c9c1e91d93d6654075079 for today.
> 
> This is still happening ... is someone going to do something about it?

Sorry, I mostly forgot about it after Matthew asked for that driver
to be dropped...?

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
