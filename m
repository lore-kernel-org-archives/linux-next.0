From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with the s5p tree
Date: Thu, 10 Nov 2011 19:41:59 -0800
Message-ID: <201111101941.59570.dmitry.torokhov@gmail.com>
References: <20111111131159.848e724c5a9257d0b9f0f0f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111111131159.848e724c5a9257d0b9f0f0f9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thursday, November 10, 2011 06:11:59 PM Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next merge of the input tree got a conflict in
> drivers/input/keyboard/Kconfig between commit 007205aa47e9 ("input:
> samsung-keypad: Add HAVE_SAMSUNG_KEYPAD config option") from the s5p
> tree and commit 5862c02d745f ("Input: samsung-keypad - enable compiling
> on other platforms") from the input tree.
> 
> I have fixed it up (probably incorrectly - see below) and can carry the
> fix as necessary.

Please drop the whole HAVE_SAMSUNG_KEYPAD thing; HAVE_CLK is all
this driver needs. Expanding beyond Samsung will allow greater
compile coverage.

Thanks.

-- 
Dmitry
