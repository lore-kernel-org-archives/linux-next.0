From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: randconfig build error with next-20140826, in
 Documentation/video4linux
Date: Wed, 27 Aug 2014 16:28:38 +0530
Message-ID: <20140827105838.GA6522@sudip-PC>
References: <CA+r1Zhh5n3p8Zg+Uvqvjeb3S859iejXkqStnnOuezTTm9UCT8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+r1Zhh5n3p8Zg+Uvqvjeb3S859iejXkqStnnOuezTTm9UCT8g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "m.chehab" <m.chehab@samsung.com>, Randy Dunlap <rdunlap@infradead.org>, linux-media <linux-media@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 26, 2014 at 09:50:43AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> ERROR: "vb2_ops_wait_finish"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ops_wait_prepare"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_event_unsubscribe"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_ctrl_subscribe_event"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_ctrl_log_status"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_streamoff"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_streamon"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_create_bufs"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_dqbuf"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_expbuf"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_qbuf"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_querybuf"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_ioctl_reqbufs"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_fop_release"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_fh_open" [Documentation/video4linux/v4l2-pci-skeleton.ko]
> undefined!
> ERROR: "vb2_fop_mmap" [Documentation/video4linux/v4l2-pci-skeleton.ko]
> undefined!
> ERROR: "video_ioctl2" [Documentation/video4linux/v4l2-pci-skeleton.ko]
> undefined!
> ERROR: "vb2_fop_poll" [Documentation/video4linux/v4l2-pci-skeleton.ko]
> undefined!
> ERROR: "vb2_fop_read" [Documentation/video4linux/v4l2-pci-skeleton.ko]
> undefined!
> ERROR: "vb2_buffer_done"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "__video_register_device"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "video_device_release_empty"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_dma_contig_init_ctx"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_queue_init"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_dma_contig_memops"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_ctrl_new_std"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_ctrl_handler_init_class"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_device_register"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_match_dv_timings"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_find_dv_timings_cap"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_valid_dv_timings"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_enum_dv_timings_cap"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "video_devdata"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_device_unregister"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "vb2_dma_contig_cleanup_ctx"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "v4l2_ctrl_handler_free"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> ERROR: "video_unregister_device"
> [Documentation/video4linux/v4l2-pci-skeleton.ko] undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
> 
> Similar to a build error from January 7th:
> https://lists.01.org/pipermail/kbuild-all/2014-January/002566.html

Hi,
I tried to build next-20140826 with your given config file . But for me everything was fine.
And I was just wondering why the skeleton code in the Documentation is building ?

thanks
sudip

