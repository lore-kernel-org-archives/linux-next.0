From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-11-16-14-52 uploaded (gpu/drm/bridge/sii902x)
Date: Fri, 16 Nov 2018 18:32:33 -0800
Message-ID: <78134da5-34dc-357e-dd92-8879281349ab@infradead.org>
References: <20181116225317.CcsXrZ5MG%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116225317.CcsXrZ5MG%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, Boris Brezillon <boris.brezillon@free-electrons.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On 11/16/18 2:53 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-11-16-14-52 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

(not caused by mmotm, just found here by make randconfig)

on x86_64:
when CONFIG_I2C_MUX is not enabled:

ld: drivers/gpu/drm/bridge/sii902x.o: in function `sii902x_remove':
sii902x.c:(.text+0x1f): undefined reference to `i2c_mux_del_adapters'
ld: drivers/gpu/drm/bridge/sii902x.o: in function `sii902x_probe':
sii902x.c:(.text+0x793): undefined reference to `i2c_mux_alloc'
ld: sii902x.c:(.text+0x7be): undefined reference to `i2c_mux_add_adapter'



-- 
~Randy
