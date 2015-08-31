From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the drm tree
Date: Mon, 31 Aug 2015 13:24:05 +1000
Message-ID: <20150831132405.4dec315e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jikos@kernel.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in:

  drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c

between commit:

  109c2f2f1c42 ("drm/nouveau/gr: switch to subdev printk macros")

from the drm tree and commit:

  4bb138a47b7f ("drm/nouveau/gr: Fix typo in nv10.c")

from the trivial tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
index 9436ada62cba,d6ace41830e9..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
@@@ -791,7 -845,7 +791,7 @@@ nv10_gr_ctx_regs_find_offset(struct nv1
  		if (nv10_gr_ctx_regs[i] == reg)
  			return i;
  	}
- 	nvkm_error(subdev, "unknow offset nv10_ctx_regs %d\n", reg);
 -	nv_error(priv, "unknown offset nv10_ctx_regs %d\n", reg);
++	nvkm_error(subdev, "unknown offset nv10_ctx_regs %d\n", reg);
  	return -1;
  }
  
@@@ -804,7 -857,7 +804,7 @@@ nv17_gr_ctx_regs_find_offset(struct nv1
  		if (nv17_gr_ctx_regs[i] == reg)
  			return i;
  	}
- 	nvkm_error(subdev, "unknow offset nv17_ctx_regs %d\n", reg);
 -	nv_error(priv, "unknown offset nv17_ctx_regs %d\n", reg);
++	nvkm_error(subdev, "unknown offset nv17_ctx_regs %d\n", reg);
  	return -1;
  }
  
