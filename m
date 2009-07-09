From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Thu, 9 Jul 2009 13:04:30 +1000
Message-ID: <20090709130430.090863dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759691AbZGIDFG@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

Hi Alan,

Today's linux-next merge of the ttydev tree got conflicts in
drivers/usb/serial/generic.c and include/linux/usb/serial.h between commit
d8298d029cdd5d944c3d8369d2862de94d12ae4b ("USB: serial: regression fix to
move sysrq from hot path") from the usb.current tree and commit
cf8456fe1aaed1776bf4c26c18adef76e472b9fa ("tty-usb-fix-perf-regression")
from the ttydev tree.  Also between commit
a2170a444ef9a89a7ec9acc72d79e5db433effc4 ("USB: serial: optimize sysrq
function calls") from the usb.current tree and commit
bfce6b042a47c9cdd55c7cd231e58710ec1fa4e1 ("tty-usb-fix-kref-leak") from
the ttydev tree.

The first two commits above seem to be trying to do the same thing (or
similar) so I have used the ttydev version for now.

I fixed them up (see below) and can carry the fixes as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/serial/generic.c
index 48f6743,21dd6e7..0000000
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
diff --cc include/linux/usb/serial.h
index 4601e0d,0ec50ba..0000000
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@@ -325,34 -330,6 +325,35 @@@ extern struct usb_serial_driver usb_ser
  extern struct bus_type usb_serial_bus_type;
  extern struct tty_driver *usb_serial_tty_driver;
  
- static inline int usb_serial_handle_sysrq_char(struct usb_serial_port *port,
++static inline int usb_serial_handle_sysrq_char(struct tty_struct *tty,
++					       struct usb_serial_port *port,
 +					       unsigned int ch)
 +{
 +#ifdef CONFIG_MAGIC_SYSRQ
 +	if (port->sysrq && port->console) {
 +		if (ch && time_before(jiffies, port->sysrq)) {
- 			handle_sysrq(ch, tty_port_tty_get(&port->port));
++			handle_sysrq(ch, tty);
 +			port->sysrq = 0;
 +			return 1;
 +		}
 +		port->sysrq = 0;
 +	}
 +#endif /* CONFIG_MAGIC_SYSRQ */
 +	return 0;
 +}
 +
 +static inline int usb_serial_handle_break(struct usb_serial_port *port)
 +{
 +#ifdef CONFIG_MAGIC_SYSRQ
 +	if (!port->sysrq) {
 +		port->sysrq = jiffies + HZ*5;
 +		return 1;
 +	}
 +	port->sysrq = 0;
 +#endif /* CONFIG_MAGIC_SYSRQ */
 +	return 0;
 +}
 +
  static inline void usb_serial_debug_data(int debug,
  					 struct device *dev,
  					 const char *function, int size,
