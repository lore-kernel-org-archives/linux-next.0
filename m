From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 16 (gpu/drm/vc4)
Date: Wed, 16 Dec 2015 11:28:20 -0800
Message-ID: <5671BB54.2030208@infradead.org>
References: <20151216164343.0cb641ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151216164343.0cb641ce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, eric@anholt.net, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On 12/15/15 21:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20151215:
> 

on i386, when CONFIG_PM_SLEEP is not enabled:

../drivers/gpu/drm/vc4/vc4_v3d.c: In function 'vc4_v3d_set_power':
../drivers/gpu/drm/vc4/vc4_v3d.c:157:29: error: called object is not a function or function pointer
   return pm_generic_poweroff(&vc4->v3d->pdev->dev);
                             ^
../drivers/gpu/drm/vc4/vc4_v3d.c:159:27: error: called object is not a function or function pointer
   return pm_generic_resume(&vc4->v3d->pdev->dev);
                           ^



-- 
~Randy
