From: Vineet Gupta <vineet.gupta1@synopsys.com>
Subject: Re: linux-next: Fixes tag needs some work in the arc-current tree
Date: Thu, 17 Jan 2019 20:52:47 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464292E3@US01WEMBX2.internal.synopsys.com>
References: <20190118073257.5809b05f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-next.vger.kernel.org

On 1/17/19 12:33 PM, Stephen Rothwell wrote:=0A=
> Hi Vineet,=0A=
>=0A=
> Commit=0A=
>=0A=
>   8e542d2a28c9 ("ARC: adjust memblock_reserve of kernel memory")=0A=
>=0A=
> Fixes tag=0A=
>=0A=
>   Fixes: 9ed68785f7f ("ARC: mm: Decouple RAM base address from kernel lin=
k addr")=0A=
>=0A=
> has these problems:=0A=
>=0A=
>   - SHA1 should be at least 12 digits long=0A=
>=0A=
=0A=
Thx for the report Stephen. Now fixed and pushed !=0A=
=0A=
-Vineet=0A=
