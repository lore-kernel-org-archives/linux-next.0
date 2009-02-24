From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: cifs tree build failure
Date: Tue, 24 Feb 2009 08:45:05 -0600
Message-ID: <524f69650902240645s62ecb412i7d54ce28f9c73a22@mail.gmail.com>
References: <20090224175649.1bcc74cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-cifs-client-bounces+glfc-linux-cifs-client=gmane.org@lists.samba.org>
In-Reply-To: <20090224175649.1bcc74cc.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.samba.org/mailman/listinfo/linux-cifs-client>,
	<mailto:linux-cifs-client-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/archive/linux-cifs-client>
List-Post: <mailto:linux-cifs-client@lists.samba.org>
List-Help: <mailto:linux-cifs-client-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/linux-cifs-client>,
	<mailto:linux-cifs-client-request@lists.samba.org?subject=subscribe>
Sender: linux-cifs-client-bounces+glfc-linux-cifs-client=gmane.org@lists.samba.org
Errors-To: linux-cifs-client-bounces+glfc-linux-cifs-client=gmane.org@lists.samba.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-cifs-client@lists.samba.org
List-Id: linux-next.vger.kernel.org

Fixed (in cifs-2.6.git)

On Tue, Feb 24, 2009 at 12:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Steve,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> fs/cifs/file.c: In function 'cifs_fsync':
> fs/cifs/file.c:1587: error: 'cifs_sb' undeclared (first use in this function)
>
> Probably caused by commit cdff0d69360ad3b87e4ac019caa73c657cfe9c76
> ("[CIFS] Add new nostrictsync cifs mount option to avoid slow SMB flush").
>
> I have dropped the cifs tree for today.
>
> --
> Cheers,
> Stephen Rothwell
>



-- 
Thanks,

Steve
