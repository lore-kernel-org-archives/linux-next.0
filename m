Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F552EBBA4;
	Tue, 28 Apr 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376182; cv=none; b=FxNeTqShsaVekM7p+mayMcljnOGQQuBVgq2KfSmrKUVd+Lqk5OyTWrolI78sS05MHr51tVifeVC/CfCVX32/8STjSoZpjsjy30NCna6CQFoZJQCL7/Zsp5QaC38/piioBaIEm1Ahl1dxFjrVfhMN8Lg1k42Mn44vJ4UHc+p2iOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376182; c=relaxed/simple;
	bh=EjuVpeXvk+QMO3YZj7e27menUivVdWrZAaKc/D2Uxb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEYKgMXKTeB1CFRylao7lLKtRRSR1WWGAvtpF5sPFEErznXZW8eiTeDY/3/OKyIptLvK9J/z9C5m0TcoN/QDwyzG9fk9FNPdc2LjibKFn7WnFetK5Cjq/BrDDN8EJLlH6NnD3CMO6sygu0Rt38GFB3iaVYjDPRetABG+nv/Ie9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvv2T7tO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvv2T7tO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160C9C2BCAF;
	Tue, 28 Apr 2026 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777376182;
	bh=EjuVpeXvk+QMO3YZj7e27menUivVdWrZAaKc/D2Uxb0=;
	h=From:To:Cc:Subject:Date:From;
	b=Bvv2T7tOfw+gh4Gtgn7oVzjhdZ0DzOfbHUpkTuYZEaPb6yvJBK/AwB1u/b3oO2inr
	 3lSXaRZSSRLWDmDlpFQU+3RwKCbMNZcshbatV3o/0/iUvT+9JC3Dx2lnaYgBWO44UO
	 RdEQQWAPqDKC5LZKPwFVjMIaKJAZeLInmSUXY56QM5/4AImV9tL4Gzp4nARJZYd8zZ
	 P3GVxTV8EcCUXzPFDo1Eu1A9C4jaIcIU/NQxV5DXnRdZDIyke4hLgahmZTaltPNrMx
	 jhD2sXKWmhsnvHsiFFUswMxOBT5kyJ+678U7wIP5CbwQTPyN0E0AT89u0jh8ZES4tZ
	 bZ79QEglbDGvw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Tue, 28 Apr 2026 13:36:14 +0200
Message-ID: <20260428113616.3896930-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

    drivers/gpu/drm/i915/display/skl_watermark.c

between commit:

    a97c88a176b6 ("drm/i915/wm: Verify the correct plane DDB entry")

from Linus' tree and commits (possibly others, too):

    4268d1397d94 ("drm/i915/wm: Extract skl_ddb_entry_verify()")
    fd52fb0d6cc2 ("drm/i915/wm: Verify 'ddb_y' as well as 'ddb'")

from the drm-intel tree.

I fixed it up manually, but it looks like I could've simply used the
version from the drm-intel tree. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.
