From: Tianyu Lan <Tianyu.Lan@microsoft.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Mon, 6 Aug 2018 06:27:13 +0000
Message-ID: <d9c9ff93-a183-798a-5404-e1768de7597c@microsoft.com>
References: <20180806151211.710b8615@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806151211.710b8615@canb.auug.org.au>
Content-Language: en-US
Content-ID: <2F560AE98EBC4A439A09680C1F38001A@APCP153.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paolo Bonzini <pbonzini@redhat.com>, =?iso-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen:
	Thanks for fix. I will discuss with maintainer about how to deal with=20
the issue.

On 8/6/2018 1:12 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the kvm tree got a conflict in:
>=20
>    arch/x86/include/asm/trace/hyperv.h
>=20
> between commit:
>=20
>    58ec5e9c9044 ("x86/hyper-v: Trace PV IPI send")
>=20
> from the tip tree and commit:
>=20
>    47c054685621 ("X86/Hyper-V: Add hyperv_nested_flush_guest_mapping ftra=
ce support")
>=20
> from the kvm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> =
