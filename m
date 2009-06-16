From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: Linus/powerpc tree build warning
Date: Tue, 16 Jun 2009 16:59:46 +1000
Message-ID: <1245135586.12400.104.camel@pasglop>
References: <20090616162429.07e74e75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090616162429.07e74e75.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Suneel <suneelg@xilinx.com>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, John Linn <john.linn@xilinx.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2009-06-16 at 16:24 +1000, Stephen Rothwell wrote:
> Hi Ben,
> 
> Today's linux-next build (powerpc ppc44x_defconfig) produced this warning:
> 
> drivers/video/xilinxfb.c: In function 'xilinxfb_assign':
> drivers/video/xilinxfb.c:328: warning: cast to pointer from integer of different size
> 
> Introduced by commit dac4ccfb64bcdd5b4c248ccc22903d67486573cd ("fbdev:
> Add PLB support and cleanup DCR in xilinxfb driver").

Known problem, a fix is currently being polished by Grant and John.

Cheers,
Ben.
