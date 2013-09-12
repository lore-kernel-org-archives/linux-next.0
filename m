From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] staging/media: fix msi3101 build errors
Date: Thu, 12 Sep 2013 10:42:20 -0700
Message-ID: <5231FCFC.40505@infradead.org>
References: <20130912143402.73f77e0cef1e19576b77a6b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20130912143402.73f77e0cef1e19576b77a6b5@canb.auug.org.au>
Sender: linux-media-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media <linux-media@vger.kernel.org>, Antti Palosaari <crope@iki.fi>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when VIDEOBUF2_CORE=m and USB_MSI3101=y.

drivers/built-in.o: In function `msi3101_buf_queue':
sdr-msi3101.c:(.text+0x1298d6): undefined reference to `vb2_buffer_done'
drivers/built-in.o: In function `msi3101_cleanup_queued_bufs':
sdr-msi3101.c:(.text+0x1299c7): undefined reference to `vb2_buffer_done'
drivers/built-in.o: In function `msi3101_isoc_handler':
sdr-msi3101.c:(.text+0x12a08d): undefined reference to `vb2_plane_vaddr'
sdr-msi3101.c:(.text+0x12a0b9): undefined reference to `vb2_buffer_done'
drivers/built-in.o: In function `msi3101_probe':
sdr-msi3101.c:(.text+0x12a1c5): undefined reference to `vb2_vmalloc_memops'
sdr-msi3101.c:(.text+0x12a1d7): undefined reference to `vb2_queue_init'
drivers/built-in.o:(.rodata+0x34cf0): undefined reference to `vb2_ioctl_reqbufs'
drivers/built-in.o:(.rodata+0x34cf4): undefined reference to `vb2_ioctl_querybuf'
drivers/built-in.o:(.rodata+0x34cf8): undefined reference to `vb2_ioctl_qbuf'
drivers/built-in.o:(.rodata+0x34d00): undefined reference to `vb2_ioctl_dqbuf'
drivers/built-in.o:(.rodata+0x34d04): undefined reference to `vb2_ioctl_create_bufs'
drivers/built-in.o:(.rodata+0x34d08): undefined reference to `vb2_ioctl_prepare_buf'
drivers/built-in.o:(.rodata+0x34d18): undefined reference to `vb2_ioctl_streamon'
drivers/built-in.o:(.rodata+0x34d1c): undefined reference to `vb2_ioctl_streamoff'
drivers/built-in.o:(.rodata+0x35580): undefined reference to `vb2_fop_read'
drivers/built-in.o:(.rodata+0x35588): undefined reference to `vb2_fop_poll'
drivers/built-in.o:(.rodata+0x35598): undefined reference to `vb2_fop_mmap'
drivers/built-in.o:(.rodata+0x355a0): undefined reference to `vb2_fop_release'
drivers/built-in.o:(.data+0x23b40): undefined reference to `vb2_ops_wait_prepare'
drivers/built-in.o:(.data+0x23b44): undefined reference to `vb2_ops_wait_finish'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Antti Palosaari <crope@iki.fi>
---
 drivers/staging/media/msi3101/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20130912.orig/drivers/staging/media/msi3101/Kconfig
+++ linux-next-20130912/drivers/staging/media/msi3101/Kconfig
@@ -1,3 +1,5 @@
 config USB_MSI3101
 	tristate "Mirics MSi3101 SDR Dongle"
 	depends on USB && VIDEO_DEV && VIDEO_V4L2
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_VMALLOC
