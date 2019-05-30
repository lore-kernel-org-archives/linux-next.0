From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next: manual merge of the userns tree with the
 arc-current tree
Date: Thu, 30 May 2019 17:11:33 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2520902@us01wembx1.internal.synopsys.com>
References: <20190530131721.0af603a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,=0A=
=0A=
On 5/29/19 8:17 PM, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
>=0A=
> Today's linux-next merge of the userns tree got a conflict in:=0A=
>=0A=
>   arch/arc/mm/fault.c=0A=
>=0A=
> between commits:=0A=
>=0A=
>   a8c715b4dd73 ("ARC: mm: SIGSEGV userspace trying to access kernel virtu=
al memory")=0A=
>   ea3885229b0f ("ARC: mm: do_page_fault refactor #5: scoot no_context to =
end")=0A=
>   acc639eca380 ("ARC: mm: do_page_fault refactor #6: error handlers to us=
e same pattern")=0A=
>   0c85612550a4 ("ARC: mm: do_page_fault refactor #7: fold the various err=
or handling")=0A=
>   c5d7f7610d88 ("ARC: mm: do_page_fault refactor #8: release mmap_sem soo=
ner")=0A=
>=0A=
> from the arc-current tree and commits:=0A=
>=0A=
>   351b6825b3a9 ("signal: Explicitly call force_sig_fault on current")=0A=
>   2e1661d26736 ("signal: Remove the task parameter from force_sig_fault")=
=0A=
>=0A=
> from the userns tree.=0A=
>=0A=
> I fixed it up (see below) and can carry the fix as necessary. This=0A=
> is now fixed as far as linux-next is concerned, but any non trivial=0A=
> conflicts should be mentioned to your upstream maintainer when your tree=
=0A=
> is submitted for merging.  You may also want to consider cooperating=0A=
> with the maintainer of the conflicting tree to minimise any particularly=
=0A=
> complex conflicts.=0A=
=0A=
=0A=
Thx for this. Unfortunately I had to force push my for-next due to broken #=
7 and=0A=
#8 above. So you may have to do this once again.=0A=
=0A=
-Vineet=0A=
