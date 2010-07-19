From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the final tree
	(powerpc related)
Date: Mon, 19 Jul 2010 10:15:41 +1000
Message-ID: <1279498541.10390.1773.camel@pasglop>
References: <20100716171920.51ce1b88.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20100716171920.51ce1b88.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martyn Welch <martyn.welch@ge.com>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 2010-07-16 at 17:19 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allmodconfig) failed like this:
> 
> ERROR: "of_i8042_kbd_irq" [drivers/input/serio/i8042.ko] undefined!
> ERROR: "of_i8042_aux_irq" [drivers/input/serio/i8042.ko] undefined!
> 
> Presumably missing EXPORT_SYMBOLs ..

Thanks. I'll fix that up.

Cheers,
Ben.
