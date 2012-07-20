From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
Date: Fri, 20 Jul 2012 09:31:39 -0700
Message-ID: <CA+55aFxiichhzqokzAmHMEEUW1286V0d37YaStcOH_e=OutDiA@mail.gmail.com>
References: <20120720103254.4a043ea94ef16992466a8b19@canb.auug.org.au> <1342769360.2984.2.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:57675 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969Ab2GTQcB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jul 2012 12:32:01 -0400
In-Reply-To: <1342769360.2984.2.camel@dabdike.int.hansenpartnership.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 20, 2012 at 12:29 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> By the way, Linus, the patch says:
>
>     Cc: Dan Williams <dan.j.williams@gmail.com>
>     Cc: Alan Stern <stern@rowland.harvard.edu>
>     Cc: James Bottomley <jbottomley@parallels.com>
>     Cc: Borislav Petkov <bp@amd64.org>
>     Cc: linux-scsi <linux-scsi@vger.kernel.org>
>
> But best I can tell it never went to either me or linux-scsi.

Both you and linux-scsi were cc'd at least in some of the discussion. Search for

  "a7a20d103994fd760766e6c9d494daa569cbfe06 makes kernel 3.5
unbootable on an Intel chipset based motherboard"

but most of the noise is in the bugzilla itself:

  https://bugzilla.kernel.org/show_bug.cgi?id=44771

and it may well be that you weren't listed for the bugzilla entry.

Ugh, how I hate bugzilla.

                Linus
