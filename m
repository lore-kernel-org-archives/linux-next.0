From: "Shai Fultheim (Shai@ScaleMP.com)" <Shai@ScaleMP.com>
Subject: RE: [PATCH] x86/build: Build VSMP support only if selected
Date: Thu, 1 Nov 2018 10:39:32 +0000
Message-ID: <SN6PR15MB2366D7688B41535AF0A331F9C3CE0@SN6PR15MB2366.namprd15.prod.outlook.com>
References: <20181030230905.xHZmM%akpm@linux-foundation.org>
 <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org>
 <alpine.DEB.2.21.1811011032190.1642@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1811011032190.1642@nanos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "broonie@kernel.org" <broonie@kernel.org>, "mhocko@suse.cz" <mhocko@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>, Ravikiran Thirumalai <kiran@scalemp.com>, X86 ML <x86@kernel.org>, "'Eial Czerwacki (eial@scalemp.com)'" <eial@scalemp.com>, 'Oren Twaig' <oren@scalemp.com>
List-Id: linux-next.vger.kernel.org

On 01/11/18 11:37, Thomas Gleixner wrote:

> VSMP support is built even if CONFIG_X86_VSMP is not set. This leads to a=
 build
> breakage when CONFIG_PCI is disabled as well.
>=20
> Build VSMP code only when selected.

This patch disables detect_vsmp_box() on systems without CONFIG_X86_VSMP, d=
ue to
the recent 6da63eb241a05b0e676d68975e793c0521387141.  This is significant
regression that will affect significant number of deployments.

We will reply shortly with an updated patch that fix the dependency on pv_i=
rq_ops,
and revert to CONFIG_PARAVIRT, with proper protection for CONFIG_PCI.
