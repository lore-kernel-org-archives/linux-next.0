Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC6390229;
	Mon, 17 Aug 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969307; cv=none; b=ForiPQhOKmwd2jpkhglab3NcnLHJpbfUdO2oaK2EOuO6h8D4y7EShJNcVWRwYBqKjC3qvTI/TATVr8kx4l6LmDPas5eTloCOyn69JMl2gOXrKLFELDPWaszwKzfajJUxVabTMvAOwdh19ZjsQgDGh2PSev4R1ywM/kzliUlFyfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969307; c=relaxed/simple;
	bh=x/iadA/bj3sVEggRQ5EBeSlhS9ARQY+Bth7SN0JGDTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jchbF1T1iUCKlX1Fu+R3596w1koqwU05pTqw4ikGrfqe64iNuDyOhc0HZ0h5mZoaXQ4F+HGGKDwl/8RseBM6QoRmQzlUYjlgKnBXCkU3CGvEMY3eUI1X86rJDhRf1SLgae3WrdyyhC91OKg7yupOeJazbV1WxeMH6gc4Ope/0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM6Gl4d1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM6Gl4d1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA5D1F000E9;
	Mon, 17 Aug 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969306;
	bh=i+9cVs3Itz2WXi725F+CyalniOJlvhgET3mZ2IxzAN4=;
	h=Date:From:To:Cc:Subject;
	b=lM6Gl4d1bWUhCZnESkgkb4WQGRV7VvZfdEf9C9rYouMRNHWUED6+JJOe0pHaGo1O7
	 o88roLmOk/hQ3oMbCB3k9tcRGRDpzp/MrD2vxtREZnrZ85hqPQm579UfyZSoduYukZ
	 +s735EltMhWhieS6cj02S6VLPDAEuwCkkwvu/AOVdwmtfbFQPJCXKsHrbZICLNfhqD
	 fZZWOc8d2uByebhHeRPN2CkYoWh/HmU6DS8OdeuRr1rmKieArmhn4dJNNYUYStbcAz
	 zOtjVm5YFZv5OXb7BWuV8LaOcvqzWvVa2p3COakRSruDmp5aQ2eFK3n3Tp5/nctqdD
	 foCEPba1DBYjw==
Date: Mon, 17 Aug 2026 13:21:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ksmbd tree
Message-ID: <aoL81uZvygzqoSd0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  3079f85137436 ("smb/server: fix tree connection leak in smb2_tree_connect()")
  5f783365518c2 ("smb/server: fix use-after-free in ksmbd_conn_transport_destroy()")
  e7317f3e41172 ("smb: server: Clear Preauth_HashValue in smb2pdu.c with kfree_sensitive()")
  7cc028dba636d ("smb: server: Free sensitive data in connection.c with kfree_sensitive()")
  d4a6d1c94f7a3 ("smb: server: Free session data in user_session.c with kfree_sensitive()")
  2a8905b807b88 ("smb: server: Make sure that passkey is not leaked on the heap in user_config.c")
  881d461b0455a ("smb: server: Clear sensitive stack and heap data in auth.c")
  a6f0870012397 ("ksmbd: fix heap out-of-bounds write in krb5_authenticate()")
  2254b665c5825 ("smb/server: deny overwriting targets with non-POSIX opens")
  e2833040b7fb0 ("smb/server: rename to ksmbd_has_nonposix_open_child()")
  4da38578bdb00 ("smb/server: fix posix state check for directory rename")
  eae925bd9e5fb ("ksmbd: exempt FSCTL_PIPE_TRANSCEIVE from the generic file-id lookup")
  c120970353e0e ("ksmbd: defer publishing granted locks to prevent UAF/double-free race")
  ad5779270cfe8 ("smb/server: preserve error status in smb2_handle_negotiate()")
  e7da30ab49972 ("smb/server: call ksmbd_proc_cleanup() on module init failure")
  4e1d6d90538f6 ("smb/server: abort initialization when proc setup fails")
  7ce638b5dc750 ("smb/server: fix invalid pointer dereference in ksmbd_stop_durable_scavenger()")
  7d2710ba196b3 ("smb/server: fix memory leak in ksmbd_vfs_set_durable_owner()")
  ea0a82bfca043 ("smb/server: fix null-ptr-deref in ksmbd_ipc_tree_connect_request()")
  6adf718e3ac7c ("ksmbd: remove extra byte from ipc_msg_alloc() size calculations")
  6d70f028ec031 ("smb/server: fix unbuffered file position alignment check")
  d914718dab107 ("smb/server: cancel async requests when closing connection")
  a4c06ff2eb66f ("smb/server: fix signing when a response uses more than one iov")
  643e05bbc393f ("ksmbd: validate ipc response length before dereferencing its fields")
  bbcaf078f1c56 ("smb: smbdirect: release pending child sockets outside the handler lock")
  0cf653af940c1 ("smb: smbdirect: avoid recursive listen.lock during cleanup")
  23b611a9b036c ("smb: smbdirect: destroy QP before mem pools on accept failure")
  14810f17bff8c ("smb: smbdirect: free completion queues with ib_free_cq()")
  c273fb69ceb89 ("ksmbd: fix slab-out-of-bounds read in ksmbd_alloc_user()")
  af25b28a866c8 ("ksmbd: fix AsyncId zeroed before use in smb2_lock() cancel response")
  e5f1ae0ce1208 ("ksmbd: fix maximal access leak when object has no NT ACL")
  c1757a7b89903 ("ksmbd: quiet mdssvc RPC log spam in create_smb2_pipe")
  628ee3ef79ba3 ("ksmbd: report actual xattr value length in stream enumeration")
  f16e92a32416d ("ksmbd: add AAPL READDIR_ATTR V2 support")
  529d203daa00b ("ksmbd: implement full-file copy for AAPL ChunkCount=0 COPYCHUNK")
  e1ff1c5e441db ("ksmbd: defer CHANGE_NOTIFY completion instead of STATUS_NOT_IMPLEMENTED")
  828ef383245e6 ("ksmbd: send inline FinderInfo in FIND responses when READDIR_ATTR negotiated")
  c3e2b774342ba ("ksmbd: synthesize empty AFP_AfpInfo xattr on first probe")
  30a19408fc739 ("ksmbd: add AAPL kAAPL_SERVER_QUERY create context support")
  91758ef64f6a6 ("smb: server: fix leak of ksmbd_ipc_login_request_ext() returned buffer")
  e360be3d03f77 ("ksmbd: skip fallocate for SMB2_CREATE_ALLOCATION_SIZE on a stream handle")
  f4cfae219a8a6 ("ksmbd: don't check directory emptiness when deleting a stream")
  fde76695019ad ("ksmbd: zero-initialize xattr_dos_attrib in smb2_update_xattrs()")
  f3c97da9d5ff9 ("ksmbd: validate out_buf_len before FSCTL_CREATE_OR_GET_OBJECT_ID and FSCTL_GET_REPARSE_POINT writes")
  337e5ea749817 ("ksmbd: fix durable handle v2 default timeout units (60 -> 60000)")
  1adf93770a92b ("ksmbd: route stream FileDispositionInformation through stream delete flag")
  64bfa9d49026b ("smb/server: use MSG_EOR for async interim response")
  2783bba8147d8 ("smb/server: introduce struct ksmbd_transport_write")
  be0e5b6201fa0 ("smb/server: send compound prefix before async pending response")
  2ba0faea9eba1 ("ksmbd: fix stale sparse-file attribute after share reconfiguration")
  6d9484a8cc355 ("ksmbd: quiet mdssvc RPC log spam")
  5b6dcf07ce45d ("ksmbd: return STATUS_OBJECT_NAME_NOT_FOUND for unknown IPC pipe names")
  57cbcca20c61b ("ksmbd: report actual xattr value length for stream EndOfFile/AllocationSize")
  566c724677ca5 ("ksmbd: route stream FileDispositionInformation through stream delete flag")
  fdf17b206bdc8 ("ksmbd: fix off-by-one rejecting minimal COPYCHUNK query-limits request")
  dc4f09401c605 ("ksmbd: Do not skip lock checks for single-byte ranges")

are missing a Signed-off-by from their committers
