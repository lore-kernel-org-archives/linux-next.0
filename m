From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: next-20160724 build: 2 failures 6 warnings (next-20160724)
Date: Sun, 24 Jul 2016 21:12:32 +0100
Message-ID: <20160724211232.6139b79f@arm.com>
References: <E1bRHH2-0004tC-9F@optimist>
	<4278236.GOabnZUd2H@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:59016 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751268AbcGXUMn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 24 Jul 2016 16:12:43 -0400
In-Reply-To: <4278236.GOabnZUd2H@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org

On Sun, 24 Jul 2016 21:59:31 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Sunday, July 24, 2016 12:08:44 PM CEST Build bot for Mark Brown wr=
ote:
> > Errors summary: 1
> >           2 ../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd=
=2Ec:48:5: error: conflicting types for 'kvm_set_routing_entry'
> >  =20
>=20
> This is a conflict between Eric Auger's "KVM: arm/arm64: Enable irqch=
ip
> routing" in the kvm-arm tree and Radim Kr=C4=8Dm=C3=A1=C5=99's "KVM: =
pass struct kvm to
> kvm_set_routing_entry" in the kvm tree.
>=20
> It just appeared in next-20160724.

I've pushed out a workaround this morning (so that it compiles both
on its own and with -next) after noticing the same thing. We'll be able
to remove it once that code gets merged.

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny.
