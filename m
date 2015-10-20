From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the powerpc tree
Date: Tue, 20 Oct 2015 16:21:55 +1100
Message-ID: <20151020162155.01391301@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Denis Kirjanov <kda@linux-powerpc.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: vmlinux.o(.text+0x9367c): Section mismatch in reference from the function .msi_bitmap_alloc() to the function .init.text:.memblock_virt_alloc_try_nid()
The function .msi_bitmap_alloc() references
the function __init .memblock_virt_alloc_try_nid().
This is often because .msi_bitmap_alloc lacks a __init
annotation or the annotation of .memblock_virt_alloc_try_nid is wrong.

Introduced (probably) by commit

  cb2d3883c603 ("powerpc/msi: Free the bitmap if it was slab allocated")

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
