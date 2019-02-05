From: Paul Burton <paul.burton@mips.com>
Subject: Re: linux-next: manual merge of the mips tree with the mips-fixes
 tree
Date: Tue, 5 Feb 2019 23:35:31 +0000
Message-ID: <20190205233530.tnk6boxzxm7okgcr@pburton-laptop>
References: <20190206091736.73bd95ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206091736.73bd95ec@canb.auug.org.au>
Content-Language: en-US
Content-ID: <9799C4E23CC3D34CA24B1F6B8C38B25B@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Huang Pei <huangpei@loongson.cn>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Feb 06, 2019 at 09:17:36AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the mips tree got conflicts in:
>=20
>   arch/mips/include/asm/barrier.h
>   arch/mips/include/asm/pgtable.h
>=20
> between commit:
>=20
>   e02e07e3127d ("MIPS: Loongson: Introduce and use loongson_llsc_mb()")
>=20
> from the mips-fixes tree and commits:
>=20
>   535113896e80 ("MIPS: Add GINVT instruction helpers")
>   82f4f66ddf11 ("MIPS: Remove open-coded cmpxchg() in set_pte()")
>=20
> from the mips tree.
>=20
> I fixed it up (see below and for the latter file, I used the mips tree
> version but wondered if cmpxchg() needs the fixups from the mips-fixes
> tree commit)

Thanks - that looks good.

cmpxchg() doesn't need the added loongson_llsc_mb() barrier that
set_pte() has in mips-fixes because for the affected Loongson 3
configurations the smp_mb__before_llsc() that cmpxchg() already contains
is equivalent (both will emit a "sync 0" instruction).

Thanks,
    Paul
