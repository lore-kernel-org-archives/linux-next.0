From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 21 (drivers/media: use of __WARN())
Date: Fri, 21 Jul 2017 09:12:12 -0700
Message-ID: <33fa1f04-8262-e18e-9f86-89d3e254554c@infradead.org>
References: <20170721141019.5776e9a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170721141019.5776e9a0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-media <linux-media@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: linux-next.vger.kernel.org

On 07/20/2017 09:10 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170720:
> 

on x86_64:
when CONFIG_BUG is not enabled:

../drivers/media/platform/pxa_camera.c:642:3: error: implicit declaration of function ‘__WARN’ [-Werror=implicit-function-declaration]
../drivers/media/platform/soc_camera/soc_mediabus.c:512:3: error: implicit declaration of function ‘__WARN’ [-Werror=implicit-function-declaration]


-- 
~Randy
