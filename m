From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160724 build: 2 failures 6 warnings (next-20160724)
Date: Sun, 24 Jul 2016 21:59:31 +0200
Message-ID: <4278236.GOabnZUd2H@wuerfel>
References: <E1bRHH2-0004tC-9F@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <E1bRHH2-0004tC-9F@optimist>
Sender: kvm-owner@vger.kernel.org
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sunday, July 24, 2016 12:08:44 PM CEST Build bot for Mark Brown wrot=
e:
> Errors summary: 1
>           2 ../arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-irqfd.c=
:48:5: error: conflicting types for 'kvm_set_routing_entry'
>=20

This is a conflict between Eric Auger's "KVM: arm/arm64: Enable irqchip
routing" in the kvm-arm tree and Radim Kr=C4=8Dm=C3=A1=C5=99's "KVM: pa=
ss struct kvm to
kvm_set_routing_entry" in the kvm tree.

It just appeared in next-20160724.

	Arnd
