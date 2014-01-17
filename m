From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 arm-soc tree
Date: Thu, 16 Jan 2014 23:35:53 -0500
Message-ID: <20140117043553.GL29184@titan.lakedaemon.net>
References: <20140117140853.6faf2c053617c5e66648526f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140117140853.6faf2c053617c5e66648526f@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Stephen,

On Fri, Jan 17, 2014 at 02:08:53PM +1100, Stephen Rothwell wrote:
> Hi Grant,
> 
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/arm/boot/dts/dove.dtsi between commits 40aad3c1a9b6 ("dt/bindings:
> Remove all references to device_type "ethernet-phy"") and b31b32119abe
> ("ARM: dove: sort DT nodes by address") from the devicetree tree and
> commit 351291754df3 ("dt/bindings: remove device_type "network"
> references") from the devicetree tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

Jason.
