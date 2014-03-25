From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: linux-next: manual merge of the keystone tree with the arm-soc
 tree
Date: Mon, 24 Mar 2014 20:00:03 -0400
Message-ID: <5330C703.5030705@ti.com>
References: <20140325105501.e63fcdd78d0d604b4e5309a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140325105501.e63fcdd78d0d604b4e5309a1@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-next.vger.kernel.org

On Monday 24 March 2014 07:55 PM, Stephen Rothwell wrote:
> Hi Santosh,
> 
> Today's linux-next merge of the keystone tree got a conflict in
> arch/arm/boot/dts/Makefile between commit ba5a37e52194 ("ARM: mvebu: Move
> kirkwood DT boards into mach-mvebu") from the arm-soc tree and commit
> 400550ae7e77 ("ARM: dts: Build all keystone dt blobs") from the keystone
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
Looks fine. Thanks

Regards,
Santosh
