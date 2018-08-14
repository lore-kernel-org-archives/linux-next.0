From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next: manual merge of the arc-current tree with Linus'
 tree
Date: Tue, 14 Aug 2018 23:00:27 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08D198@us01wembx1.internal.synopsys.com>
References: <20180815081141.3f1b1059@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/14/2018 03:11 PM, Stephen Rothwell wrote:=0A=
> Hi Vineet,=0A=
>=0A=
> Today's linux-next merge of the arc-current tree got a conflict in:=0A=
>=0A=
>   arch/arc/include/asm/atomic.h=0A=
>=0A=
> between commit:=0A=
>=0A=
>   ab0b910490fe ("atomics/arc: Define atomic64_fetch_add_unless()")=0A=
>=0A=
> from Linus' tree and commit:=0A=
>=0A=
>   39456148db74 ("ARC: atomic64: fix atomic64_add_unless function")=0A=
>=0A=
> from the arc-current tree.=0A=
>=0A=
> I fixed it up (I just used the version from Linus' tree for now) and=0A=
> can carry the fix as necessary. This is now fixed as far as linux-next=0A=
> is concerned, but any non trivial conflicts should be mentioned to your=
=0A=
> upstream maintainer when your tree is submitted for merging.  You may=0A=
> also want to consider cooperating with the maintainer of the conflicting=
=0A=
> tree to minimise any particularly complex conflicts.=0A=
=0A=
Thx for the report Stephen. I've dropped my patch for now, let the dust set=
tle and=0A=
then we can add it.=0A=
=0A=
Thx,=0A=
-Vineet=0A=
