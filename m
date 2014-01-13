From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the mmc tree with Linus' tree
Date: Mon, 13 Jan 2014 09:11:41 -0800
Message-ID: <31979761-213c-4b65-b14a-b6ef3b2ca60d@AM1EHSMHS002.ehs.local>
References: <20140113131700.840c214536826d7e9a92ef8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140113131700.840c214536826d7e9a92ef8b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Ball <chris@printf.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 13, 2014 at 01:17:00PM +1100, Stephen Rothwell wrote:
> Hi Chris,
>=20
> Today's linux-next merge of the mmc tree got a conflict in MAINTAINER=
S
> between commit c2fd4e380322 ("MAINTAINERS: set up proper record for
> Xilinx Zynq") from Linus' tree and commit 45f210424b4b ("mmc: arasan:=
 Add
> driver for Arasan SDHCI") from the mmc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

The fix is correct, AFAICT.

	Thanks,
	S=C3=B6ren
