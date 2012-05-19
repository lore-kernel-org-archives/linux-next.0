From: Dave Airlie <airlied@gmail.com>
Subject: Re: linux-next: Tree for May 18 (drm drivers and vgacon)
Date: Sat, 19 May 2012 16:40:50 +0100
Message-ID: <CAPM=9txuEJMv2Ttr+rEB0SFTnatB-hGNMNdKcmmNjXNyQfPfYg@mail.gmail.com>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
	<4FB6F115.70703@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <4FB6F115.70703@xenotime.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

On Sat, May 19, 2012 at 2:02 AM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 05/18/2012 01:49 AM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 201205017:
>
>
> When CONFIG_VGA_CONSOLE is not enabled:
>
> drivers/gpu/drm/cirrus/cirrus_drv.c:87:2: error: implicit declaration of function 'vgacon_text_force'
> drivers/gpu/drm/ast/ast_drv.c:224:2: error: implicit declaration of function 'vgacon_text_force'
> drivers/gpu/drm/mgag200/mgag200_drv.c:96:2: error: implicit declaration of function 'vgacon_text_force'

Thanks Randy,

fix pushed to drm-next.

Dave.
