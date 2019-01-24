From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: linux-next: arm multi_v7_defconfig build failure next-20190124
Date: Thu, 24 Jan 2019 22:27:42 +0530
Message-ID: <CA+G9fYv0m79UC+Pq9Cq_5vGcos8A87oPYA7Ph7LUyZrfEkLXQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, computersforpeace@gmail.com, gregory.0xf0@gmail.com, p.zabel@pengutronix.de, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

linux-next 20190122,  20190123 and 20190124 build arm
multi_v7_defconfig failed like this:
drivers/reset/reset-brcmstb.o: In function `brcmstb_reset_probe':
reset-brcmstb.c:(.text+0x110): undefined reference to `__aeabi_uldivmod'
reset-brcmstb.c:(.text+0x160): undefined reference to `__aeabi_uldivmod'

Full test log,
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/448/console

Best regards
Naresh Kamboju
