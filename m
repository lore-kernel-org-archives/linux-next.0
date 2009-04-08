From: Alan Modra <amodra@bigpond.net.au>
Subject: Re: linux-next: build failure
Date: Wed, 8 Apr 2009 14:42:03 +0930
Message-ID: <20090408051202.GA27796@bubble.grove.modra.org>
References: <20090408140407.14dc5242.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20090408140407.14dc5242.sfr@canb.auug.org.au>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org

On Wed, Apr 08, 2009 at 02:04:07PM +1000, Stephen Rothwell wrote:
>   LD      vmlinux.o
> powerpc-linux-ld: TOC section size exceeds 64k

I'm starting to sound like a cracked record, but I'll say it again:
ld -r does not merely package together object files, it transforms
them.   Try using thin archives instead.

-- 
Alan Modra
Australia Development Lab, IBM
