From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the kdbus tree with the arm-soc tree
Date: Mon, 16 Mar 2015 09:12:24 +0100
Message-ID: <20150316081224.GA12392@kroah.com>
References: <20150316161626.32e838f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150316161626.32e838f5@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <damm+renesas@opensource.se>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 16, 2015 at 04:16:26PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the kdbus tree got a conflict in
> Documentation/Makefile between commit c6535e1e0361 ("Documentation:
> Remove ZBOOT MMC/SDHI utility and docs") from the arm-soc tree and
> commit 48480f8c402c ("kdbus: add documentation") from the kdbus tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc Documentation/Makefile
> index bc0548201755,5e3fde632d03..000000000000
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@@ -1,4 -1,4 +1,4 @@@
>  -subdir-y := accounting arm auxdisplay blackfin connector \
>  +subdir-y := accounting auxdisplay blackfin connector \
> - 	filesystems filesystems ia64 laptops mic misc-devices \
> + 	filesystems filesystems ia64 kdbus laptops mic misc-devices \
>   	networking pcmcia prctl ptp spi timers vDSO video4linux \
>   	watchdog

Thanks, the merge looks fine to me.

greg k-h
