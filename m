From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] GenWQE: Replace dynamic_hex_dump with
 print_hex_dump_debug
Date: Fri, 20 Dec 2013 07:33:09 -0800
Message-ID: <20131220153309.GA21797@kroah.com>
References: <CA+r1Zhimt7Xusnc4kkkVqfoRhfZRnreMmZqaN7WP7rSpZ3XTvw@mail.gmail.com>
 <1387553171-31469-2-git-send-email-haver@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387553171-31469-2-git-send-email-haver@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Haverkamp <haver@linux.vnet.ibm.com>
Cc: fengguang.wu@intel.com, jim.epost@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org
List-Id: linux-next.vger.kernel.org

On Fri, Dec 20, 2013 at 04:26:11PM +0100, Frank Haverkamp wrote:
> As requested by Greg, replacing the hexdump function from dynamic_debug.h
> with one defined in printk.h. I hope I picked the right one.

No, just use the "%*ph" modifier for printk.

So, you can do it all on just one line:
  	scnprintf(prefix, sizeof(prefix), "%s %s: %*ph\n",
  		  GENWQE_DEVNAME, pci_name(pci_dev), size, buff);

And even then, do you really need this genwqe_hexdump() function at all
anymore?  What is it used for?

greg k-h
