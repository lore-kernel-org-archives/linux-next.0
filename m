From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm tree
Date: Sat, 12 Aug 2017 00:01:46 +1000
Message-ID: <20170812000146.0d133ee6@canb.auug.org.au>
References: <20170811092816.01875df0@canb.auug.org.au>
        <31a4ba52-fc76-7844-841c-5f15142d473d@redhat.com>
        <20170811123623.GA28649@flask>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752765AbdHKOBs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Aug 2017 10:01:48 -0400
In-Reply-To: <20170811123623.GA28649@flask>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>

Hi Radim,

On Fri, 11 Aug 2017 14:36:24 +0200 Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@red=
hat.com> wrote:
>
> Should all rebases be done with the --signoff option?

More or less.  rebase with the --signoff option will add a duplicate
Signed-off-by unless the already existing one is last in the current
commit.

Linus has said that doing a rebase is no different to applying a patch,
so a new committer needs to add a Signed-off-by tag.

--=20
Cheers,
Stephen Rothwell
