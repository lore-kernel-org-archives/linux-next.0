From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Fri, 27 Sep 2013 18:04:24 -0700
Message-ID: <20130928010424.GB22939@kroah.com>
References: <20130927182117.42cdf5287fa1e9b40dd3f8e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130927182117.42cdf5287fa1e9b40dd3f8e9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 27, 2013 at 06:21:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/tty/serial/8250/8250_dw.c: In function 'dw8250_probe':
> drivers/tty/serial/8250/8250_dw.c:341:3: error: too many arguments to function 'dw8250_probe_acpi'
>    err = dw8250_probe_acpi(&uart, data);
>    ^
> drivers/tty/serial/8250/8250_dw.c:281:19: note: declared here
>  static inline int dw8250_probe_acpi(struct uart_8250_port *up)
>                    ^
> 
> Caused by commit fe95855539fd ("serial: 8250_dw: don't limit DMA support
> to ACPI") from the tty tree.
> 
> I have reverted that commit for today (and commit 7fb8c56c7fa0 ("serial:
> 8250_dw: provide a filter for DMA channel detection") that depends on it).

Should now be fixed, thanks.

greg k-h
