From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 13 (drivers/spmi/spmi-pmic-arb.c)
Date: Wed, 13 Feb 2019 08:47:03 -0800
Message-ID: <fb0508f1-131d-ff17-9b5d-123ec75275dd@infradead.org>
References: <20190213183900.2f68474f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213183900.2f68474f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2/12/19 11:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190212:
> 

seen on i386:

when CONFIG_IRQ_DOMAIN_HIERARCHY is not enabled:

../drivers/spmi/spmi-pmic-arb.c:1154:2: error: unknown field ‘activate’ specified in initializer
  .activate = qpnpint_irq_domain_activate,
  ^
../drivers/spmi/spmi-pmic-arb.c:1154:2: warning: initialization from incompatible pointer type [enabled by default]
../drivers/spmi/spmi-pmic-arb.c:1154:2: warning: (near initialization for ‘pmic_arb_irq_domain_ops.match’) [enabled by default]
../drivers/spmi/spmi-pmic-arb.c:1155:2: error: unknown field ‘alloc’ specified in initializer
  .alloc = qpnpint_irq_domain_alloc,
  ^
../drivers/spmi/spmi-pmic-arb.c:1155:2: warning: initialization from incompatible pointer type [enabled by default]
../drivers/spmi/spmi-pmic-arb.c:1155:2: warning: (near initialization for ‘pmic_arb_irq_domain_ops.select’) [enabled by default]
../drivers/spmi/spmi-pmic-arb.c:1156:2: error: unknown field ‘free’ specified in initializer
  .free = irq_domain_free_irqs_common,
  ^
../drivers/spmi/spmi-pmic-arb.c:1156:10: error: ‘irq_domain_free_irqs_common’ undeclared here (not in a function)
  .free = irq_domain_free_irqs_common,
          ^
../drivers/spmi/spmi-pmic-arb.c:1157:2: error: unknown field ‘translate’ specified in initializer
  .translate = qpnpint_irq_domain_translate,
  ^
../drivers/spmi/spmi-pmic-arb.c:1157:2: warning: initialization from incompatible pointer type [enabled by default]
../drivers/spmi/spmi-pmic-arb.c:1157:2: warning: (near initialization for ‘pmic_arb_irq_domain_ops.unmap’) [enabled by default]



-- 
~Randy
