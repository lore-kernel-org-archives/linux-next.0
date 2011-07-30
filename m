From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] sfi: sfi_acpi.c needs sysfs.h
Date: Fri, 29 Jul 2011 18:09:12 -0700
Message-ID: <20110729180912.82054516.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:48649 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752739Ab1G3BJO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 21:09:14 -0400
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, lenb@kernel.org, sfi-devel@simplefirmware.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@xenotime.net>

sfi_acpi.c needs to include linux/sysfs.h for data types.

drivers/sfi/sfi_core.h:66: error: field 'attr' has incomplete type
drivers/sfi/sfi_acpi.c:179: warning: 'struct kobject' declared inside parameter list
drivers/sfi/sfi_acpi.c:179: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/sfi/sfi_acpi.c:182: warning: type defaults to 'int' in declaration of '__mptr'
drivers/sfi/sfi_acpi.c:182: warning: initialization from incompatible pointer type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/sfi/sfi_core.h |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20110729.orig/drivers/sfi/sfi_core.h
+++ linux-next-20110729/drivers/sfi/sfi_core.h
@@ -55,6 +55,9 @@
   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 */
+
+#include <linux/sysfs.h>
+
 struct sfi_table_key{
 	char	*sig;
 	char	*oem_id;
