From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the s5p tree with the arm tree
Date: Wed, 28 Dec 2011 17:33:19 +0900
Message-ID: <01fd01ccc53b$5a2c5960$0e850c20$%kim@samsung.com>
References: <20111228103326.b4f211f3c46127b8acf2dda6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20111228103326.b4f211f3c46127b8acf2dda6@canb.auug.org.au>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Russell King' <rmk@arm.linux.org.uk>, 'Thomas Abraham' <thomas.abraham@linaro.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
> Today's linux-next merge of the s5p tree got a conflict in
> arch/arm/mach-s5p64x0/init.c between commit 95af214becab ("ARM: 7246/1:
> S5P64X0: introduce arch/arm/mach-s5p64x0/common.[ch]") from the arm tree
> and commit afba7f91e640 ("ARM: SAMSUNG: remove struct
> 's3c24xx_uart_clksrc' and all uses of it") from the s5p tree.
> 
> I just removed the file, but the latter patch will probably need applying
> in some form to arch/arm/mach-s5p64x0/common.c.

OK, let me fix it.
Thanks for your time :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
