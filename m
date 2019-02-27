From: Michael Kelley <mikelley@microsoft.com>
Subject: RE: linux-next: Tree for Feb 27 (mshyperv)
Date: Wed, 27 Feb 2019 18:51:35 +0000
Message-ID: <DM5PR2101MB09184DFB7037015F99C5EB93D7740@DM5PR2101MB0918.namprd21.prod.outlook.com>
References: <20190227174427.4e8f7f24@canb.auug.org.au>
 <a6cfb923-c21e-b0e3-44e1-33197aac2625@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6cfb923-c21e-b0e3-44e1-33197aac2625@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, "joro@8bytes.org" <joro@8bytes.org>, Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org> Sent: Wednesday, February 27, 20=
19 9:25 AM
>
> on i386:
>=20
> ../arch/x86/kernel/cpu/mshyperv.c: In function 'ms_hyperv_init_platform':
> ../arch/x86/kernel/cpu/mshyperv.c:339:3: error: 'x2apic_phys' undeclared =
(first use in this
> function)
>    x2apic_phys =3D 1;
>    ^

FYI, the kbuild test robot flagged this issue overnight, and Tianyu Lan sub=
mitted a
fix earlier this morning.

Michael
