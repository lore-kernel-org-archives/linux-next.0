Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iv8ooXpq"
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB40B9;
	Mon,  4 Dec 2023 02:52:33 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66B6C2000D;
	Mon,  4 Dec 2023 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701687152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGW0aYaSSgY7TbVn7mSy7EgFtx4MSa9KcaOfi7zh3LA=;
	b=iv8ooXpqwTm8wRYeLHrtRDLvjizLyoyApYNVhbJn9vWZSMP9gMM4ji/koDOEB4AWp7Hcfq
	Kvhe+28Bn2YS2xI8QgV9y5Q954Gw+wiSxRge4R1kVkkd1HfxqyyHdDoCXs5t7dRF4+YMma
	SEF8wBl66viXznFYmTc53TT+Hk63OqhWLn7Cg/t1EgCIk4C0+FgN0RJ/i/9+fuvxDzp7DI
	g+7zW1zQyZAzg82Ta4jymaQOPGyU6+VPPjfRhDwg7EpUwvaur+kPlIIoko47pBf5EO+CZh
	yurS+qGrc+x0Dkz5x8DsCpF0ICc0sAgaqmynU2hAHlyhgzIrk7wFVoiI9fcuHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Date: Mon,  4 Dec 2023 11:52:29 +0100
Message-Id: <20231204105229.870290-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201212446.189491-1-dregan@broadcom.com>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'578dc962ff2000ba4bf52d50717aea0819615634'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-12-01 at 21:24:46 UTC, dregan wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Add deassert_wp description comment
> 
> Signed-off-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
