From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the akpm tree with the slab tree
Date: Wed, 14 Sep 2011 09:35:09 +0300
Message-ID: <CAOJsxLEkPbgYCPkknK1ZiPH6RjmAQbLgPnvb=mBVOQrY67m47g@mail.gmail.com>
References: <20110914162425.f96e77178dd836da6f825de2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110914162425.f96e77178dd836da6f825de2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Christoph Lameter <cl@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 14, 2011 at 9:24 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the scsi-post-merge tree got a conflict i=
n
> mm/slab.c between commit fdde6abb3e8d ("slab: use print_hex_dump") fr=
om
> the slab tree and commit 0cf5ab251a1a ("When we get corruption report=
s,
> it's useful to see if the kernel was") from the akpm tree.
>
> Just context changes. =A0I fixed it up (see below) and can carry the =
fix as
> necessary.

Andrew, if you send me the patch to penberg@cs.helsinki.fi, I can fix
up the conflict and carry it in my tree.

                        Pekka
