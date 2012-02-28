From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the powerpc tree
Date: Mon, 27 Feb 2012 21:38:43 -0700
Message-ID: <CACxGe6sLLxUL4U3fP6dOSOu+tYaMZkG6z7RWHqp-CX06Ztp1CQ@mail.gmail.com>
References: <20120228130634.3c511b096bc78f9b99e804fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120228130634.3c511b096bc78f9b99e804fe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On Mon, Feb 27, 2012 at 7:06 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/powerpc/platforms/iseries/Kconfig between commit 3d066d77cf46
> ("powerpc: remove CONFIG_PPC_ISERIES from the architecture Kconfig
> files") from the powerpc tree and commit 0f22dd395fc4 ("of: Only comp=
ile
> OF_DYNAMIC on PowerPC pseries and iseries") from the devicetree tree.
>
> The former commit removes the file (as the legacy iSeries platform is
> being removed), so I did that.

Okay, thanks.

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
