From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: linux-next: manual merge of the tile tree with Linus' tree
Date: Tue, 13 Mar 2012 20:56:21 -0400
Message-ID: <4F5FECB5.3090806@tilera.com>
References: <20120314111057.499d4901f51264c2012fd2b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120314111057.499d4901f51264c2012fd2b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On 3/13/2012 8:10 PM, Stephen Rothwell wrote:
> Hi Chris,
>
> Today's linux-next merge of the tile tree got a conflict in arch/Kconfig
> between commit 43570fd2f47b ("mm,slub,x86: decouple size of struct page
> from CONFIG_CMPXCHG_LOCAL") (and a couple after) from Linus' tree and
> commit ca3a3d347e23 ("ipc: provide generic compat versions of IPC
> syscalls") from the tile tree.
>
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

Thanks!  I'll sync up that tree over the next couple of days as I start
pushing out some more changes to get ready for 3.4 merge window.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
