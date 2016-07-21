From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 21 (gpu/virtio)
Date: Thu, 21 Jul 2016 09:21:44 -0700
Message-ID: <eae4bce5-3624-7ef7-f6b8-ca2c3caad2d0@infradead.org>
References: <20160721165631.6508756a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160721165631.6508756a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org
List-Id: linux-next.vger.kernel.org

On 07/20/16 23:56, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160720:
> 

on x86_64, when CONFIG_FB is not enabled:

ERROR: "remove_conflicting_framebuffers" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!


-- 
~Randy
