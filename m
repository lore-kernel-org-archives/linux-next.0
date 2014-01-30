From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the init tree with the kvm/kvm-ppc trees
Date: Wed, 29 Jan 2014 22:33:48 -0500
Message-ID: <CAP=VYLoid=spfhT5z5AxgLuXPXxj5J4ZVv+JOcr2bXAjSYOu=w@mail.gmail.com>
References: <20140130142708.6d47d4d63683e32b7ae16c80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:64224 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166AbaA3DeV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2014 22:34:21 -0500
In-Reply-To: <20140130142708.6d47d4d63683e32b7ae16c80@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexander Graf <agraf@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>

On Wed, Jan 29, 2014 at 10:27 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the init tree got conflicts in
> arch/powerpc/kvm/44x.c, arch/powerpc/kvm/e500.c,
> arch/powerpc/kvm/e500mc.c between commit 398a76c677a2 ("KVM: PPC: Add
> devname:kvm aliases for modules") from the kvm/kvm-ppc trees and commit
> "powerpc: kvm e500/44x is not modular, so don't use module_init" from the
> init tree.
>
> It sounds like there may be some intent to allow these to be built as
> modules in the future, so for now I have just reverted the init tree
> patch to these files and can carry the fix as necessary (no action is
> required).

Thanks, I'll check it out tomorrow morning (EDT) once you've published
the latest linux-next and update accordingly,

Paul.
--

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
