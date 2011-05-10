From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: linux-next: build failure after merge of the voltage tree
Date: Tue, 10 May 2011 09:38:32 +0100
Message-ID: <1305016712.3206.2.camel@odin>
References: <20110510124434.b30a7631.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110510124434.b30a7631.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Graeme Gregory <gg@slimlogic.co.uk>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Tue, 2011-05-10 at 12:44 +1000, Stephen Rothwell wrote:
> Hi Liam,
> 
> After merging the voltage tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "tps65910_gpio_init" [drivers/mfd/tps65910.ko] undefined!
> ERROR: "tps65910_irq_init" [drivers/mfd/tps65910.ko] undefined!
> ERROR: "irq_modify_status" [drivers/mfd/tps65910-irq.ko] undefined!
> ERROR: "irq_set_chip_and_handler_name" [drivers/mfd/tps65910-irq.ko] undefined!
> ERROR: "handle_edge_irq" [drivers/mfd/tps65910-irq.ko] undefined!
> 
> I have used the voltage tree from next-20110509 for today.

Jorge, could you send a fix for this today.

Thanks

Liam
