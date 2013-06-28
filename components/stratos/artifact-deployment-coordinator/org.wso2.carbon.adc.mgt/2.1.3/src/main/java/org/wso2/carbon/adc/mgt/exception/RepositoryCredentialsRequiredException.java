/*
 * Copyright 2013, WSO2, Inc. http://wso2.org
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */
package org.wso2.carbon.adc.mgt.exception;

public class RepositoryCredentialsRequiredException extends Exception {

	private static final long serialVersionUID = 1L;

	private String message;

	public RepositoryCredentialsRequiredException(String message, Throwable cause) {
		super(message, cause);
		this.message = message;
	}

	public RepositoryCredentialsRequiredException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
}
