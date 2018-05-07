From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
Subject: [PATCH bpf-next] xsk: fix 64-bit division
Date: Mon,  7 May 2018 19:43:50 +0200
Message-ID: <20180507174350.3534-1-bjorn.topel@gmail.com>
References: <e9890e95-16b4-4540-301b-43f17a824808@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e9890e95-16b4-4540-301b-43f17a824808@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ast@fb.com, daniel@iogearbox.net, netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, magnus.karlsson@intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Björn Töpel <bjorn.topel@intel.com>

i386 builds report:
  net/xdp/xdp_umem.o: In function `xdp_umem_reg':
  xdp_umem.c:(.text+0x47e): undefined reference to `__udivdi3'

This fix uses div_u64 instead of the GCC built-in.

Fixes: c0c77d8fb787 ("xsk: add user memory registration support sockopt")
Signed-off-by: Björn Töpel <bjorn.topel@intel.com>
---
 net/xdp/xdp_umem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 881dfdefe235..2b47a1dd7c6c 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -209,7 +209,7 @@ int xdp_umem_reg(struct xdp_umem *umem, struct xdp_umem_reg *mr)
 	if ((addr + size) < addr)
 		return -EINVAL;
 
-	nframes = size / frame_size;
+	nframes = (unsigned int)div_u64(size, frame_size);
 	if (nframes == 0 || nframes > UINT_MAX)
 		return -EINVAL;
 
-- 
2.14.1
