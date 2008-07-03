From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Wed, 2 Jul 2008 23:47:39 -0600
Message-ID: <20080703054739.GA643@secretlab.ca>
References: <20080703133905.7b6f058f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20080703133905.7b6f058f.sfr@canb.auug.org.au>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, jonsmirl@gmail.com, galak@kernel.crashing.org
Cc: Jean Delvare <khali@linux-fr.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Timur Tabi <timur@freescale.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 03, 2008 at 01:39:05PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the powerpc tree got a conflict in
> arch/powerpc/sysdev/fsl_soc.c between commit
> 4eac6a8b17ce5ebe66eb94b6a0b43aa3a2bf7ea6 ("i2c-mpc: Convert to an
> of_platform driver") from the i2c tree and commits

It probably would have been better for this patch to go in via the
PowerPC tree.  It only touches powerpc-specific i2c code, not any i2c
core code.  There are quite a few MPCxxxx ports which use this driver,
I'd be happier to see it dropped from the i2c tree and merged in via
either Kumar or myself.

I'd also like to see some acks from people who have tested this patch
before it goes in.  (I'm just as guilty here; I'll apply it and test it
to my tree tomorrow).

g.
